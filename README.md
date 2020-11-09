## How to run

```
bundle && rackup
```

## How to run specs
```
rspec
```

## Allowed values
Allowed values for LSOA and postcodes are in file `data/allowed.yml`

You can edit this file to allow more values

## Structure
The main part is in the `lib` folder.
### Services
Implements two services: `allowed values` and `postcodes io`.
#### Allowed_values
This is responsible for getting allowed data from external sources. Can be extended if more sourcess are added. For now it reads data from the `yml` file.
#### Postcodes_io
Integration with `postcodes.io`. Additional classes for different endpoint should be added here.

### Operations
It implements classes responsible for main site operations. The main class `CheckPostcode` is implemented here.

## Specs
End to end test are implemented in `spec/requests` folder.
All tested endpoints requests are mocked by `VCR` gem. Responses are stored in `spec/casettes` folder as `yml` files.

